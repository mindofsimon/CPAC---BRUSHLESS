//reading sound file
s.reboot;
p = thisProcess.nowExecutingPath.dirname +/+ "AK - Ronald Reagan Blvd.wav";
b = Buffer.read(s, p);

//SynthDef creation
(
x = SynthDef(\song_Buffer, { arg out = [0, 1], bufnum, rev=0 , room=0;
	Out.ar(out,FreeVerb.ar(PlayBuf.ar(2, bufnum, BufRateScale.kr(bufnum)),rev,room));
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
		var rev, room;

		msg.postln;
		rev=msg[1];
		room=msg[2];

		~buff.set(\rev, rev, \room,room);

	},
	"/sonification");
)