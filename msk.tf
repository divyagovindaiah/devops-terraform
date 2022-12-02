resource "aws_msk_cluster" "example" {
  cluster_name           = "example"
  kafka_version          = "3.3.1"
  number_of_broker_nodes = 3
   


  broker_node_group_info {
    instance_type = "kafka.t3.small"
    client_subnets = [resource.aws_cloudformation_stack.network.outputs["Subnet1"],
                    resource.aws_cloudformation_stack.network.outputs["Subnet2"],
                    resource.aws_cloudformation_stack.network.outputs["Subnet3"]]
    security_groups = [resource.aws_cloudformation_stack.network.outputs["Securitygroup1"],
                      resource.aws_cloudformation_stack.network.outputs["Securitygroup2"],
                      resource.aws_cloudformation_stack.network.outputs["Securitygroup1"]]
       
       

                         
  
         
  }
}
               
           
    