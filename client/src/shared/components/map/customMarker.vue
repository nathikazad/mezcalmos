<template>
  <div :style="{'position': 'absolute'}">
    <slot/>
  </div>
</template>
<script>
import * as VueGoogleMaps from "vue2-google-maps";
/* global google */
export default {
  mixins: [VueGoogleMaps.MapElementMixin],
  props: {
    position: {
      type: Object,
      default: undefined
    }
  },
  methods: {},
  data() {
    return {
      current: null,
      origin: null
    };
  },
  provide() {
    const self = this;
console.log(this);

    return this.$mapPromise.then(map => {
      class Overlay extends google.maps.OverlayView {
        constructor(map) {
          super();
          this.setMap(map);
          self.current = new google.maps.LatLng(
            self.position.lat,
            self.position.lng
          );
        }
        draw() {
          const container = self.$el;
          let pos = this.getProjection().fromLatLngToDivPixel(self.current);
          container.style.left = pos.x + "px";
          container.style.top = pos.y + "px";
        }
        onAdd() {
          const container = self.$el;
          const panes = this.getPanes();
          panes.floatPane.appendChild(container);

          google.maps.event.addDomListener(
            self.$map.getDiv(),
            "mouseleave",
            () => {
              google.maps.event.trigger(container, "mouseup");
            }
          );

          google.maps.event.addDomListener(container, "mousedown", e => {
            container.style.cursor = "move";
            self.$map.set("draggable", false);
            self.origin = e;

            const mouseMoveHandler = google.maps.event.addDomListener(
              self.$map.getDiv(),
              "mousemove",
              e => {
                let left = self.origin.clientX - e.clientX;
                let top = self.origin.clientY - e.clientY;
                let pos = self.$overlay
                  .getProjection()
                  .fromLatLngToDivPixel(self.current);
                let latLng = self.$overlay
                  .getProjection()
                  .fromDivPixelToLatLng(
                    new google.maps.Point(pos.x - left, pos.y - top)
                  );
                self.origin = e;
                self.current = latLng;
                this.draw();
              }
            );

            google.maps.event.addDomListener(container, "mouseup", () => {
              self.$map.set("draggable", true);
              container.style.cursor = "default";
              google.maps.event.removeListener(mouseMoveHandler);
            });
          });
        }
        onRemove() {
          self.$el.remove();
        }
      }
      this.$overlay = new Overlay(map);
    });
  },
  destroyed() {
    this.$overlay.setMap(null);
    this.$overlay = undefined;
  }
};
</script>