Example config repo: https://github.com/nthomson-pivotal/paasify-pipelines-pks-configuration

```
credhub set -n /concourse/main/git_private_key -t ssh -p <path to your git ssh private key file>
```

```
fly -t cp set-pipeline -p install-opsman -c pipelines/install-upgrade-opsman/pipeline.yml -l ../paasify-pipelines-pks-configuration/pksdev/fly.yml
```

```
fly -t cp set-pipeline -p install-pks -c pipelines/install-product/pipeline.yml -v product_slug=pivotal-container-service -l ../paasify-pipelines-pks-configuration/pksdev/fly.yml
```

```
fly -t cp set-pipeline -p delete-environment -c pipelines/delete-environment/pipeline.yml -l ../paasify-pipelines-pks-configuration/pksdev/fly.yml
```



phases
- create vars file from Terraform state
- yq to merge
- credhub interpolate