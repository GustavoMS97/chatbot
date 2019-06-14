var waves = new SineWaves({
    el: document.getElementById('waves'),

    speed: 4,

    width: 900,

    height: 100,

    ease: 'SineInOut',

    wavesWidth: '100%',

    waves: [
        {
            timeModifier: 4,
            lineWidth: 2,
            amplitude: -50,
            wavelength: 10
        },
        {
            timeModifier: 4,
            lineWidth: 1,
            amplitude: -20,
            wavelength: 5
        }
    ],

    // Resize
    resizeEvent: function () {
        var gradient = this.ctx.createLinearGradient(0, 0, this.width, 0);
        gradient.addColorStop(0, "blue");

        var index = -1;
        var length = this.waves.length;
        while (++index < length) {
            this.waves[index].strokeStyle = gradient;
        }

        // Clean Up
        index = void 0;
        length = void 0;
        gradient = void 0;
    }
});