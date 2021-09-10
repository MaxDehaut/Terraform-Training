# Exercise 2.05 - Configuration drift in Azure

## Step 1 - Force a configuration drift

- Check on Azure Portal
- Update tag through Azure Portal and collect its identifier

```terraform
terraform plan
terraform import «rg_name» «identifier»
terraform show
```

## Step 2 - Destroy a resource

```terraform
terraform destroy
```
