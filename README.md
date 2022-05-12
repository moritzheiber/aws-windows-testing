# Create a short-lived Windows instance on EC2

I needed this for testing out some cross-platform Rust code and didn't want to run a heavy Windows 10 virtual machine on my laptop. So I created this Terraform code to start a Windows instance on EC2, which can cost as low as one cent ([literally, for a t3.nano instance](https://aws.amazon.com/ec2/pricing/on-demand/)) an hour and can be provisioned in a matter of minutes. The default instance size is `t3a.large`, simply for convenience.

Outputs are the public IP address, the instance's DNS entry and the decoded password for the `Administrator` account. You need to specifically access the output for the Windows password in order to see it:

```console
$ terraform output windows_password
```

## Usage

```console
$ terraform [plan|apply|destroy]
```

By default the code is using `eu-central-1`, which can be overridden by setting the `TF_VAR_region` variable to any other AWS-compatible region.


## Getting all available AWS AMI IDs for Windows

```
$ aws ec2 describe-images --owners amazon --filters "Name=platform,Values=windows" --query 'sort_by(Images, &CreationDate)[].Name'
```
