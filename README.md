# Create a short-lived Windows instance on EC2

I needed this for testing out some cross-platform Rust code and didn't want to run a heavy Windows 10 virtual machine on my laptop. So I created this Terraform code to start a Windows instance on EC2, which costs one cent ([literally, for a t3.nano instance](https://aws.amazon.com/ec2/pricing/on-demand/)) an hour and can be provisioned in a matter of minutes.

Outputs are the public IP address and the decoded password for the `Administrator` account.

## Getting all available AWS AMI IDs for Windows

```
$ aws ec2 describe-images --owners amazon --filters "Name=platform,Values=windows" --query 'sort_by(Images, &CreationDate)[].Name'
```
