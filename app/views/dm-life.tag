<dm-life>
  <canvas id="life"></canvas>

  <script type="es6">
    class Life {
      constructor (canvas, size) {
        this.canvas = canvas;
        if (this.supported()) {
          this.size = size;
          this.c2d = this.canvas.getContext('2d');
          this.grid = new Grid(this.c2d, true, false);
          this.automaton = new Automaton(this.size);
          this.addGliders();
          this.setTick();
          this.requestAnimationFrame();
        }
      }

      supported () {
        return !!(this.canvas && this.canvas.getContext);
      }

      draw () {
        this.setDimensions();
        this.clear();
        var alpha = ((new Date()).getTime() - this.time) / 1000;
        this.grid.draw(this.width, this.height, this.size, this.generation, alpha);
        this.requestAnimationFrame();
      }

      setDimensions () {
        var parent = this.canvas.parentElement;
        if (this.width !== parent.clientWidth || this.height !== parent.clientHeight) {
          this.width = parent.clientWidth;
          this.height = parent.clientHeight;
          this.canvas.width = this.width;
          this.canvas.height = this.height;
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

      setTick () {
        this.generation = this.automaton.currentGen;
        this.time = (new Date()).getTime();
        setInterval(() => {
          this.generation = this.automaton.tick();
          this.time = (new Date()).getTime();
        }, 1000);
      }

      addGliders () {
        // North Glider
        this.automaton.addCell(10, 2);
        this.automaton.addCell(10, 3);
        this.automaton.addCell(10, 4);
        this.automaton.addCell(11, 4);
        this.automaton.addCell(12, 3);

        // East Glider
        this.automaton.addCell(15, 10);
        this.automaton.addCell(15, 11);
        this.automaton.addCell(16, 10);
        this.automaton.addCell(16, 12);
        this.automaton.addCell(17, 10);

        // South Glider
        this.automaton.addCell(7, 16);
        this.automaton.addCell(8, 15);
        this.automaton.addCell(9, 15);
        this.automaton.addCell(9, 16);
        this.automaton.addCell(9, 17);

        // West Glider
        this.automaton.addCell(2, 9);
        this.automaton.addCell(3, 7);
        this.automaton.addCell(3, 9);
        this.automaton.addCell(4, 8);
        this.automaton.addCell(4, 9);
      }
    }

    class Grid {
      constructor (c2d, withLines, withOrigin) {
        this.c2d = c2d;
        this.withLines = withLines;
        this.withOrigin = withOrigin;
      }

      draw (width, height, size, generation, alpha) {
        var halfWidth = width / 2;
        var spacing = Math.ceil(width / size);
        
        this.c2d.save();
        this.c2d.translate(halfWidth, halfWidth);
        this.drawGrid(spacing, halfWidth, height);
        
        this.c2d.translate(-size * spacing / 2, -size * spacing / 2);
        this.c2d.translate(spacing / 2, spacing / 2);
        this.drawGeneration(spacing, generation, alpha);
        
        this.c2d.restore();
      }

      drawGrid (spacing, halfWidth, height) {
        this.c2d.beginPath();
        this.drawOrigin(spacing);

        if (this.withLines) {
          //vertical
          var x, y;
          for (x = 0; x < halfWidth; x += spacing) {
            this.drawLine(x, height - halfWidth, x, -halfWidth);
          }
          for (x = spacing; x > -halfWidth; x -= spacing) {
            this.drawLine(x, height - halfWidth, x, -halfWidth);
          }

          //horizontal
          for (y = 0; y < (height - halfWidth); y += spacing) {
            this.drawLine(halfWidth, y, -halfWidth, y);
          }
          for (y = spacing; y > -halfWidth; y -= spacing) {
            this.drawLine(halfWidth, y, -halfWidth, y);
          }
        }

        this.c2d.strokeStyle = 'rgb(222, 222, 222)';
        this.c2d.stroke();
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

      drawGeneration (spacing, generation, alpha) {
        var radius = spacing * 0.4;
        var maxAlpha = 0.5;
        alpha = alpha * maxAlpha;

        var color = 'rgba(222, 222, 222, ' + alpha + ')';
        for (let cell of generation.births) {
          this.drawCell(spacing, cell, radius, color);
        }

        color = 'rgba(222, 222, 222, ' + maxAlpha + ')';
        for (let cell of generation.living) {
          this.drawCell(spacing, cell, radius, color);
        }

        color = 'rgba(222, 222, 222, ' + (maxAlpha - alpha) + ')';
        for (let cell of generation.deaths) {
          this.drawCell(spacing, cell, radius, color);
        }
      }

      drawCell (spacing, cell, radius, color) {
        this.c2d.beginPath();
        this.c2d.arc(spacing * cell.x, spacing * cell.y, radius, 0, 360);
        this.c2d.fillStyle = color;
        this.c2d.fill();
      }
    }

    class Automaton {
      constructor (size) {
        this.size = size;
        this.currentGen = new Generation(this.size);
      }

      addCell (x, y) {
        this.currentGen.setLiving(x, y);
      }

      tick () {
        var nextGen = new Generation(this.size);
        for (var x = 0; x < this.size; ++x) {
          for (var y = 0; y < this.size; ++y) {
            var count = this.currentGen.countNeighbors(x, y);
            var alive = this.currentGen.isAlive(x, y);
            if (!alive && count === 3) {
              nextGen.setBorn(x, y);
            } else if (alive && (count < 2 || count > 3)) {
              nextGen.setDead(x, y);
            } else if (alive && (count === 2 || count ===3)) {
              nextGen.setLiving(x, y);
            }
          }
        }
        this.currentGen = nextGen;
        return this.currentGen;
      }
    }

    class Generation {
      constructor (size) {
        this.size = size;
        this.cells = [];
        for (var x = 0; x < size; ++x) {
          this.cells[x] = [];
        }
        this.births = [];
        this.living = [];
        this.deaths = [];
      }

      setBorn (x, y) {
        this.cells[x][y] = true;
        this.births.push({x, y});
      }

      setLiving (x, y) {
        this.cells[x][y] = true;
        this.living.push({x, y});
      }

      setDead (x, y) {
        this.deaths.push({x, y});
      }

      isAlive (x, y) {
        return this.cells[this.wrapToroid(x)][this.wrapToroid(y)] ? 1 : 0;
      }

      wrapToroid (n) {
        if (n < 0) {
          return this.size - 1;
        }
        if (n >= this.size) {
          return 0;
        }
        return n;
      }

      countNeighbors (x, y) {
        return this.isAlive(x - 1, y - 1)
          + this.isAlive(x, y - 1)
          + this.isAlive(x + 1, y - 1)
          + this.isAlive(x - 1, y)
          + this.isAlive(x + 1, y)
          + this.isAlive(x - 1, y + 1)
          + this.isAlive(x, y + 1)
          + this.isAlive(x + 1, y + 1);
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
