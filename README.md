Example config repo: https://github.com/nthomson-pivotal/paasify-pipelines-pas-configuration

```
credhub set -n /concourse/main/git_private_key -t ssh -p <path to your git ssh private key file>
```

```
fly -t cp set-pipeline -p install-opsman -c pipelines/install-upgrade-opsman/pipeline.yml -l ../paasify-pipelines-pas-configuration/dev/fly.yml
```

```
fly -t cp set-pipeline -p install-pas -c pipelines/install-product/pipeline.yml -v product_slug=elastic-runtime -l ../paasify-pipelines-pas-configuration/dev/fly.yml
```

```
fly -t cp set-pipeline -p delete-environment -c pipelines/delete-environment/pipeline.yml -l ../paasify-pipelines-pas-configuration/dev/fly.yml
```



phases
- create vars file from Terraform state
- yq to merge
- credhub interpolate