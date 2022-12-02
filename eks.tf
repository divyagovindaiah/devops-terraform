module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "17.24.0"

  cluster_name    = "my-eks"
  cluster_version = "1.21"


  vpc_id     = resource.aws_cloudformation_stack.network.outputs["MyVpc"]
  subnet_ids = [resource.aws_cloudformation_stack.network.outputs["Subnet1"],
               resource.aws_cloudformation_stack.network.outputs["Subnet2"]]
               
               
  

  enable_irsa = true

  eks_managed_node_group_defaults = {
    disk_size = 50
  }
}
resource "aws_iam_role" "workernodes" {
  name = "eks-node-group-example"
 
  assume_role_policy = jsonencode({
   Statement = [{
    Action = "sts:AssumeRole"
    Effect = "Allow"
    Principal = {
     Service = "ec2.amazonaws.com"
    }
   }]
   Version = "2012-10-17"
  })
 }
 
 
 


  
  
  
 

