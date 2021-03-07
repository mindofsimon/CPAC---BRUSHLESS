//reading sound file
s.boot;
p = thisProcess.nowExecutingPath.dirname +/+ "AK - Ronald Reagan Blvd.wav";
b = Buffer.read(s, p);

//SynthDef creation
(
x = SynthDef(\song_Buffer, { arg out = [0, 1], bufnum, mix=1, pos=0, dust_amp=0, freq=200;
	Out.ar(out,Pan2.ar(LPF.ar(Mix.ar([FreeVerb.ar(PlayBuf.ar(1, bufnum, BufRateScale.kr(bufnum)), mix), Dust.ar(20,dust_amp)]),freq), pos));
}).add();
)

~buff=Synth(\song_Buffer, [\bufnum,b]);

x.free; b.free;//to stop them...

//Connection with Processing
NetAddr("127.0.0.1",57120);

//Receiving from Processing
(//controlling mix and room parameters of Reverb
OSCdef('OSCreceiver',
	{
		arg msg;
		var ctrlx, ctrly, bright, dust;

		msg.postln;
		ctrlx=msg[1];
		ctrly=msg[2];
		bright=msg[3];
		dust=msg[4];

		~buff.set(\mix, bright, \pos, ctrlx, \freq, (1-bright)*20000+200, \dust_amp, dust);

	},
	"/sonification");
)