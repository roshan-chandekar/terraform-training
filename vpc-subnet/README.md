Step-01: Create VPC
    Name: my-manual-vpc
    IPv4 CIDR Block: 10.0.0.0/16
    Rest all defaults
    Click on Create VPC

Step-02: Public Subnet
    VPC ID: my-manual-vpc
    Subnet Name:: my-public-subnet-1
    Availability zone: ap-south-1a
    IPv4 CIDR Block: 10.0.1.0/24

Step-03: Create Internet Gateway and Associate it to VPC
    Name Tag: my-igw
    Click on Create Internet Gateway
    Click on Actions -> Attach to VPC -> my-manual-vpc

Step-04: Create Public Route Table
    Name tag: my-public-route-table
    vpc: my-manual-vpc
    Click on Create

Step-05: Create Public Route in newly created Route Table
    Click on Add Route
    Destination: 0.0.0.0/0
    Target: my-igw
    Click on Save Route

Step-06: Associate Public Subnet in Route Table
    Click on Edit Subnet Associations
    Select my-public-subnet-1
    Click on Save



####################################################
Manually created resources to be import inn tf state file
added resource in main.tf file to know these are resource to be added during import



terraform import aws_vpc.my_manual_vpc vpc-0d3e9a5f8c47f089d
terraform import aws_subnet.my_public_subnet_1 subnet-07f1ebd0b4c84ac7e
