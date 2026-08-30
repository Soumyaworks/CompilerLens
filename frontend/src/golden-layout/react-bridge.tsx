/**
 * Bridge between golden-layout's imperative component model and React.
 *
 * golden-layout v2 is not React-aware: registering a component means handing it a factory
 * function that receives a raw `ComponentContainer` with a plain DOM element (`.element`)
 * to render into, and is responsible for its own cleanup. This is the same shape Compiler
 * Explorer's own panes use (`static/hub.ts` registers one factory per pane type;
 * `static/panes/*.ts` are vanilla classes, not React) -- we are doing the same registration
 * dance, just with a React root standing in for a vanilla class instance.
 *
 * The bridge is intentionally the only place that touches golden-layout's raw API. Every
 * pane component below it is ordinary React: it receives its initial state via a typed
 * prop, manages its own hooks, and never knows it is inside a golden-layout container.
 */

import type {ComponentContainer, GoldenLayout} from 'golden-layout';
import type {ReactNode} from 'react';
import {createRoot, type Root} from 'react-dom/client';

/**
 * Register a React component as a golden-layout component type.
 *
 * `render` is called once per pane instance, at creation time, with that pane's initial
 * state (from `componentState` in the layout config, or from `layout.addComponent`'s second
 * argument). The React root created here persists for the pane's lifetime; all further
 * updates happen through the rendered component's own hooks, not by calling `render` again.
 */
export function registerReactPane<State>(
  layout: GoldenLayout,
  typeName: string,
  render: (initialState: State | undefined, container: ComponentContainer) => ReactNode,
): void {
  layout.registerComponentFactoryFunction(typeName, container => {
    const root: Root = createRoot(container.element);
    root.render(render(container.initialState as State | undefined, container));
    // Deferred: golden-layout's own teardown (e.g. tearing down the whole workspace when
    // navigating back to the landing page) fires 'destroy' for every pane synchronously,
    // inside React's own commit for the unmounting Workspace. Unmounting these nested
    // roots in the same tick fights that commit ("Attempted to synchronously unmount a
    // root while React was already rendering"); a microtask lets it finish first.
    container.on('destroy', () => queueMicrotask(() => root.unmount()));
    return undefined;
  });
}
