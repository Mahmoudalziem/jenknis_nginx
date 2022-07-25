## Configurations 
Using Ansible to install  dependencies and deploy jenkins on gke. 

 * **Dependencies :**
       
     1. Pip: to use python library 
     2. Kubectle: to connect to cluster api
     3. JDK-11: to use vm as a slave for Jenkins
     4. Docker: to docrize app and push it to Docker hub
     5. Kubernates library : to use k8s module in ansible 
 * **Deployment:**
     
     using k8s module
 
     1. create new namespace to deploy Jenkins pod on it 
     2. create statfulset for Jenkins
     3. create service loadbalancer to use Jenkins
    
    using command module 
     
    1. get loadbalancer ip
    2. get Jenkins admin's password

