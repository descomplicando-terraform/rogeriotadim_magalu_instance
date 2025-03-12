package test

import (
	"fmt"
	"strings"
	"testing"

	"github.com/gruntwork-io/terratest/modules/random"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestTerraformInstanceName(t *testing.T) {
	uniqueId := random.UniqueId()
	name := strings.ToLower(fmt.Sprintf("instance-test-%s", uniqueId))

	// retryable errors in terraform testing.
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../example/",
		Vars: map[string]interface{}{
			"name": name,
		},
	})

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	output := terraform.Output(t, terraformOptions, "instances_name")
	assert.Contains(t, output, name)
}
