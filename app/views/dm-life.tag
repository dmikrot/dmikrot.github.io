<dm-life>
  <canvas id="life"></canvas>

  <script type="es6">
    class Life {
      constructor (canvas, size) {
        this.canvas = canvas;
        if (this.supported()) {
          this.cellsX = size;
          this.c2d = this.canvas.getContext('2d');
          this.grid = new Grid(this.c2d, true);
          this.requestAnimationFrame();
        }
      }

      supported () {
        return !!(this.canvas && this.canvas.getContext);
      }

      draw () {
        this.setDimensions();
        this.clear();
        this.grid.draw(this.width, this.height, this.cellSize, '#e8f5e9');
        this.requestAnimationFrame();
      }

      setDimensions () {
        var parent = this.canvas.parentElement;
        if (this.width !== parent.clientWidth || this.height !== parent.clientHeight) {
          this.width = parent.clientWidth;
          this.height = parent.clientHeight;
          this.canvas.width = this.width;
          this.canvas.height = this.height;
          this.cellSize = Math.ceil(this.width / this.cellsX);
          this.cellsY = Math.ceil(this.height / this.cellSize);
        }
      }

      clear () {
        this.c2d.clearRect(0, 0, this.width, this.height);
      }

      requestAnimationFrame () {
        window.requestAnimationFrame(() => {
          this.draw();
        });
      }
    }

    class Grid {
      constructor (c2d, withOrigin) {
        this.c2d = c2d;
        this.withOrigin = withOrigin;
      }

      draw (width, height, spacing, color) {
        this.c2d.save();
        var halfWidth = width / 2;
        var halfHeight = height / 2;
        this.c2d.translate(halfWidth, halfHeight);

        this.drawOrigin(spacing);

        //vertical
        var x, y;
        for (x = 0; x < halfWidth; x += spacing) {
          this.drawLine(x, halfHeight, x, -halfHeight);
        }
        for (x = spacing; x > -halfWidth; x -= spacing) {
          this.drawLine(x, halfHeight, x, -halfHeight);
        }

        //horizontal
        for (y = 0; y < halfHeight; y += spacing) {
          this.drawLine(halfWidth, y, -halfWidth, y);
        }
        for (y = spacing; y > -halfHeight; y -= spacing) {
          this.drawLine(halfWidth, y, -halfWidth, y);
        }

        this.c2d.strokeStyle = color;
        this.c2d.stroke();
        this.c2d.restore();
      }

      drawLine (fromX, fromY, toX, toY) {
        this.c2d.moveTo(fromX, fromY);
        this.c2d.lineTo(toX, toY);
      }

      drawOrigin (spacing) {
        if (this.withOrigin) {
          //circle origin
          var radius = Math.max(spacing / 8, 5);
          this.c2d.moveTo(radius, 0);
          this.c2d.arc(0, 0, radius, 0, 360);
        }
      }
    }

    var tag = this;
    function startLife() {
      var canvas = tag.root.firstElementChild;
      if (canvas) {
        var life = new Life(canvas, 20);
      } else {
        setTimeout(startLife, 10);
      }
    }

    startLife();
  </script>

  <style scoped>
    :scope {
      position: fixed;
      top: 0;
      left: 0;
      width: 100vw;
      height: 100vh;
      z-index: -100;
    }

    :scope > canvas {
      display: block;
    }
  </style>
</dm-life>
