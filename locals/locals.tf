locals {
    final_name = "${var.project}-${var.environment}-${var.component}"

    ec2_tags = merge(
        var.common_tags,
        {
            Version = "1.1.0"
            Evironment = "Dev"
        }
    )
  
}