Angular 2 Attribute Directives
==============================

Shown by example;

```javascript
import { Directive, ElementRef, HostListener, Input } from '@angular/core';

@Directive({
  selector: '[egHighlight]'
})
export class HighlightDirective {
  private defaultColor = 'red';
  private el: HTMLElement;

  constructor(el: ElementRef) {
    this.el = el.nativeElement;
  }

  @Input() egHighlight: string;

  @Input() set egHighlightDefaultColor(colorName: string) {
    this.defaultColor = colorName || this.defaultColor;
  }

  @HostListener('mouseenter') onMouseEnter() {
    this.highlight(this.egHighlight || this.defaultColor);
  }

  @HostListener('mouseleave') onMouseLeave() {
    this.highlight(null);
  }

  private highlight(color: string) {
    this.el.style.backgroundColor = color;
  }
}
```

Usage;

```html
<p [egHighlight]="color" [egHighlightDefaultColor]="red">Highlight me!</p>
```

Where `"color"` is a model.

`ElementRef` services grants us direct access to the DOM element through its `nativeElement` property.
