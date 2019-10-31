# RHEL8 FIPS-mode on GCP

Create a rhel8 instance that's FIPS-mode enabled and has packages required to build openshift/origin

## Create the instance

**If the images are built and available in your project/zone, all you need to get started is the `gcloud` CLI tool.**

Launch a rhel8, fips-enabled instance with packages required to build openshift/origin.
Images are available in google project `OpenShift GCE Devel`, no need to build images.
Replace $INSTANCE with your instance tag. 

```shell
$ gcloud compute instances create $INSTANCE \
  --image-family rhel8-fips \
  --zone us-east1-c \
  --min-cpu-platform "Intel Haswell" \
  --machine-type n1-standard-8 \
  --boot-disk-type pd-ssd --boot-disk-size 256GB
```

## Images

Images are built with [Packer](https://www.packer.io). Override variables as necessary.

### Source image

The source image is `rhel-8`.

```shell
$ packer build rhel8-fips-source.json
```

To override any default variable value, for example, Google Project ID:

```shell
$ packer build -var 'project=your-google-project-id' rhel8-fips-source.json
```

### Provisioned image

The provisioned image installs packages and flips `sudo fips-mode-setup --enable`.

```shell
$ packer build rhel8-fips-enabled.json
```
To override any default variable value, for example, Google Project ID:

```shell
$ packer build -var 'project=your-google-project-id' rhel8-fips-enabled.json
```
