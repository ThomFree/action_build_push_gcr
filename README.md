# Github Action for Google Container Registry

A GitHub Action for building docker image and pushing them to Google Container Registry.

## Usage

In your actions workflow, insert this:

```bash
- name: Build and push to GCR
  uses: ThomFree/action_build_push_gcr@1.0
  with:
    image: [your-hostname]/[your-project]/[image]
    project: [your-project]
    region: [gcp-region]
    service key: ${{ secrets.GCLOUD_AUTH }}
```

Your `GCLOUD_AUTH` secret (or whatever you name it) must be a base64 encoded
gcloud service key with the following permissions:
- Service Account User
- Storage Admin

The image must be "pushable" to one of Google's container registries, i.e. it
should be in the `gcr.io/[project]/[image]` or `eu.gcr.io/[project]/[image]`
format.