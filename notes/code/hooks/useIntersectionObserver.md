## Svelte 5

### Set context

In `+layout.ts` or any root pages :

``` ts
  let intersectionObserver = $state<null | IntersectionObserver>(null);
  let intersectedElement = $state<null | Element>(null);

  onMount(() => {
    intersectionObserver = new IntersectionObserver(
      (entries) => {
        const entry = entries.find((entry) => entry.isIntersecting);
        intersectedElement = entry?.target || null;
      },
      {
        threshold: 0.5,
      },
    );
  });

  setContext<{
    observer: null | IntersectionObserver;
    intersectedElement: null | Element;
  }>("intersectionObserver", {
    get observer(): null | IntersectionObserver {
      return intersectionObserver;
    },
    get intersectedElement(): null | Element {
      return intersectedElement;
    },
  });
  ```
### Hook implementation

In `useIntersectionObserver.svelte.ts` :

```ts
import { getContext } from "svelte";

export const useIntersectionObserver = () => {
  let element = $state<HTMLElement | undefined>();

  let intersectionObserverContext = getContext<{
    observer: null | IntersectionObserver;
    intersectedElement: null | Element;
  }>("intersectionObserver");

  $effect(() => {
    if (!intersectionObserverContext.observer || !element) {
      return;
    }

    const effectElement = element;

    const observer = intersectionObserverContext.observer;
    observer.observe(effectElement);

    return () => observer.unobserve(effectElement);
  });

  let intersect = $derived(
    !intersectionObserverContext.observer ||
      !element ||
      intersectionObserverContext.intersectedElement === element,
  );

  return {
    get intersect() {
      return intersect;
    },
    set element(value: HTMLElement) {
      element = value;
    },
  };
};
```
### Use in components

```ts
  let intersectionObserver = useIntersectionObserver();
```

```html
<div bind:this={intersectionObserver.element}>
    {#if intersectionObserver.intersect}
        <span>Intersected !</span>
    {/if}
</div>
```
