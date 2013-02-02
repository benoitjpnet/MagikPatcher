hi fags

you can get xdelta3.0u.x86-32.exe from http://xdelta.googlecode.com/files/xdelta3.0u.x86-32.exe
it's not included due to it being lolGPL code.
that said, my code/binary released under the "do whatever the fuck you want to do with it" licence.

HOWTO for patch makers
======================
1) put xdelta3.0u.x86-32.exe in the same folder as autodelta.exe and deltainjector.exe
2) if you don't already have it in your path, also copy it to the folder that contains your source and destination files
3) create a patch using xdelta like you normally would, but ensure that you've got the filenames exactly as your leechers will have them,
since unlike the old technique of a zip file containing a bat, we will be using the filenames that xdelta embeds into the patch file.
3.5) TL note: the syntax for creating a patch with xdelta is:
	xdelta3.0u.x86-32.exe -es source.mkv dest.mkv patch.xdelta3
     TL note note: don't forget that source.mkv and dest.mkv have to be the actual filenames that your leechers will have
4) Copy autodelta.exe to a leecher friendly name (eg. Some_Crappy_Animu_Ep01_v1_to_v2.exe)
5) Run:
	deltainjector.exe Some_Crappy_Animu_Ep01_v1_to_v2.exe xdelta3.0u.x86-32.exe patch.xdelta3
6) Get Some_Crappy_Animu_Ep01_v1_to_v2.exe out to your leechers and tell them to double click it
7) If lunixfags complain, tell them to use wine

HOWTO for leechers
==================
Double click it, yo.