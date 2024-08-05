import os

for path,di,files in os.walk("."):
    print(path)
    for i in files:
        if i.endswith(".ogg"):
            os.system("ffmpeg -i " + str(path) + "/" + str(i) + " -af \"aformat=sample_fmts=s16:sample_rates=44100\" " + str(path) + "/" + str(i)[:-4] + ".wav")
