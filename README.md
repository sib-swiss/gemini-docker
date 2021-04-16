
Docker image for Gemini: https://github.com/arq5x/gemini

It is available here: [https://hub.docker.com/repository/docker/jdelafon/gemini](https://hub.docker.com/repository/docker/jdelafon/gemini)

Build the image locally:
```
docker build -t gemini .
```

Basic usage (prints version):
```
docker run gemini -v
```

Annotation:

> Annotation is broken with the automatic install script provided by Gemini, 
> because of the versions of Pysam supported by Conda.
> The version tagged "-patched" includes a dirty fix that allows the annotation functionality to work,
> at the expense of being able to read positions from BAM files (?) with Pysam.

Assuming your annotation files are in a host directory `./gemini_data`
and your VFC source files (.vcf, .ped) are in `./datasets`
```
docker run -it --rm --name gemini \
-v $(pwd)/gemini_data:/usr/local/share/gemini/gemini_data \
-v $(pwd)/datasets:/datasets \
gemini load -t VEP -v /datasets/test.vep.vcf.gz -p /datasets/test.ped /datasets/test.db
```
will generate a Gemini db file `./datasets/test.db` 
