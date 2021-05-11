//reading sound file
s.boot;
p = thisProcess.nowExecutingPath.dirname +/+ "AK - Ronald Reagan Blvd.wav";
b = Buffer.read(s, p);

//SynthDef definition
(
x = SynthDef(\song_Buffer, { arg out = [0, 1], bufnum, mix=1, pos=0, dust_amp=0, freq=200;
	Out.ar(out,Pan2.ar(LPF.ar(Mix.ar([FreeVerb.ar(PlayBuf.ar(1, bufnum, BufRateScale.kr(bufnum)), mix), Dust.ar(20,dust_amp)]),freq), pos));
}).add();
)

//create the Synth
~buff=Synth(\song_Buffer, [\bufnum,b]);

//Connection with Processing
NetAddr("192.168.2.11",57120);

//Receiving from Processing
(//controlling mix and room parameters of Reverb
OSCdef('OSCreceiver',
	{
		arg msg;
		var ctrlx, depth, bright, dust;

		msg.postln;
		ctrlx=msg[1];
		bright=msg[2];
		dust=msg[3];
		depth=msg[4];

		~buff.set(\mix, (1-depth), \pos, ctrlx, \freq, (1-bright)*20000+200, \dust_amp, dust);

	},
	"/sonification");
)