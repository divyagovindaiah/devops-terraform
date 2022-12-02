resource "aws_cloudformation_stack" "network" {
  name = "networking-stack"

  
  template_body = <<STACK
{
  
  "Resources" : {
    "MyVpc": {
      "Type" : "AWS::EC2::VPC",
      "Properties" : {
        "CidrBlock" : "10.0.0.0/16"
        
      }
    },
     "Subnet1": {
     "Type" : "AWS::EC2::Subnet",
     "Properties" : {
       "VpcId" : {"Ref" : "MyVpc"},
       "CidrBlock": "10.0.0.0/24",
       "AvailabilityZone": "ap-northeast-1a"
     }
     },
   "Subnet2": {
     "Type" : "AWS::EC2::Subnet",
     "Properties" : {
      "VpcId" : {"Ref" : "MyVpc"},
      "CidrBlock" : "10.0.1.0/24",
      "AvailabilityZone": "ap-northeast-1c"
     }
   },
   "Subnet3": {
     "Type" : "AWS::EC2::Subnet",
     "Properties" : {
      "VpcId" : {"Ref" : "MyVpc"},
      "CidrBlock" : "10.0.2.0/24",
      "AvailabilityZone": "ap-northeast-1d"
     }
   },
    "Securitygroup1": {
     "Type": "AWS::EC2::SecurityGroup",
      "Properties": {
       "GroupDescription": "Securitygroup 1",
       "VpcId" : {"Ref" : "MyVpc"},
         "SecurityGroupIngress" : [ 
        { 
            "IpProtocol" : "tcp", 
            "FromPort" : 22, 
            "ToPort" : 22, 
            "CidrIp" : "10.0.0.0/24" 
        },
        { 
            "IpProtocol" : "icmp", 
            "FromPort" : 8, 
            "ToPort" : -1, 
            "CidrIp" : "10.0.0.0/24" 
        }]
       
      }
    },
    "Securitygroup2": {
     "Type": "AWS::EC2::SecurityGroup",
      "Properties": {
       "GroupDescription": "Securitygroup 2",
       "VpcId" : {"Ref" : "MyVpc"},
         "SecurityGroupIngress" : [ 
        { 
            "IpProtocol" : "tcp", 
            "FromPort" : 22, 
            "ToPort" : 22, 
            "CidrIp" : "10.0.0.0/24" 
        },
        { 
            "IpProtocol" : "icmp", 
            "FromPort" : 8, 
            "ToPort" : -1, 
            "CidrIp" : "10.0.0.0/24" 
        }]
       
      }
    },
    "Securitygroup3": {
     "Type": "AWS::EC2::SecurityGroup",
      "Properties": {
       "GroupDescription": "Securitygroup 2",
       "VpcId" : {"Ref" : "MyVpc"},
         "SecurityGroupIngress" : [ 
        { 
            "IpProtocol" : "tcp", 
            "FromPort" : 22, 
            "ToPort" : 22, 
            "CidrIp" : "10.0.0.0/24" 
        },
        { 
            "IpProtocol" : "icmp", 
            "FromPort" : 8, 
            "ToPort" : -1, 
            "CidrIp" : "10.0.0.0/24" 
        }]
       
      }
    }
  },
  "Outputs" : {
     "MyVpc" :{
       "Value" : {"Ref" : "MyVpc"},
       "Export": {
         "Name": "Vpc"
        } 
      },

     "Subnet1" :{
       "Value" : {"Ref" : "Subnet1"},
       "Export": {
         "Name": "Subnet1"
        } 
      },
      
      "Subnet2" :{
       "Value" : {"Ref" : "Subnet2"},
       "Export": {
         "Name": "Subnet2"
        } 
      },

      
      "Subnet3" :{
       "Value" : {"Ref" : "Subnet3"},
       "Export": {
         "Name": "Subnet3"
        } 
      },
      "Securitygroup1" :{
        "Value" : {"Ref" : "Securitygroup1"},
        "Export": {
          "Name": "Securitygroup1"
        }
      },
       "Securitygroup2" :{
        "Value" : {"Ref" : "Securitygroup2"},
        "Export": {
          "Name": "Securitygroup2"
        }
      },
       "Securitygroup3" :{
        "Value" : {"Ref" : "Securitygroup3"},
        "Export": {
          "Name": "Securitygroup3"
        }
      }
       
       

  }

  
  

   
         
    
    
   
    
   
  
  


   
   

   

   
   


  
}
STACK
}
