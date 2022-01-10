package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

// An example of how to test the Terraform module in examples/terraform-aws-rds-example using Terratest.
func TestTerraformAwsIamExample(t *testing.T) {
	t.Parallel()

	awsRegion := "us-west-2"
	//expectedName := ""
	//expecteddashboardname := ""
	// Construct the terraform options with default retryable errors to handle the most common retryable errors in
	// terraform testing.
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: ".",

		// Variables to pass to our Terraform code using -var options
		// "username" and "password" should not be passed from here in a production scenario.
		Vars: map[string]interface{}{
			//"awsiamuser": expectedName,
			//"dashboardname": expecteddashboardname,
			"region": awsRegion,
		},
	})

	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)

	// This will run `terraform init` and `terraform apply` and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)

	// Run `terraform output` to get the value of an output variable
	//iamUserName := terraform.Output(t, terraformOptions, "aws_iam_user.awsiamuser.id")
	//fmt.Println(iamUserName)
}
