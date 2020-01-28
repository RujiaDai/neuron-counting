
dir = getDirectory("Choose a Directory");

list = getFileList(dir);


count = 1;
for (i=0; i<list.length; i++) 
{
	if(endsWith(list[i], ".JPG")) 
	{
		open(list[i]);
		CellCounter();
		close();
	}
}

function CellCounter() {
	run("8-bit");
    setAutoThreshold("Default");
	setOption("BlackBackground", false);
	run("Convert to Mask");
	run("Analyze Particles...", "size=0-Infinity show=Overlay display exclude summarize");
	currDialog = getInfo("window.type");
}

Dialog.create("Status");
Dialog.addMessage("Operation complete!");
Dialog.show();