# K8s learnings

### Start Minikube in local
	a. Start with docker driver 
		minikube start --driver=docker
	b. Check minikube started or not
		minikube status

	c. Check whether kubenretes created or not
		kubectl cluster-info
	d. to check node ia created in cluster 
		kubectl get node
### Give access of local docker to kubernetes local cluster
	a. Make kubernetes use local docker a repository, execute the last line of below command output 
		minikube -p minikube docker-env --shell cmd
	b. Execute output of above command as a command, execute each line seperrately
	c. To see wheter you image is being displayed or not next to kubenrtes images, run below command
		docker images
	d. If its there it means kuberntes cluster can access your image from local docker otherwise run below command to access your image in minikube 
		minikube image load <image:tag>
		e.g. minikube image load spk8s:1.0
### Create deployment object using command prompt
	a. Create deployment in default namespace
		kubectl create deployment spk8s --image=spk8s:1.0 --port=8080
	b. Check wheather deployment is created or not
		kubectl get deployment
	c. Describe deployment
		kubectl describe deployment spk8s
	d. How to check pods
		kubectl get pods
### How to expose your application for outside world of k8s cluster
	1. Use below command to create a service for your kubernetes service
		kubectl expose deployment spk8s --type=NodePort
	2. Check the service that you created
		kubectl get service
	3. Get the url to access your service  by url 
		minikube service spk8s --url
	4. Use the url that you get as a output of above command to access your application
### Open minikube dashboard
	1. Monitor kubernetes cluster and your services reosurce in browser UI, please execute below command
	    minikube dashboard	
### Delete any resource in the cluster
	a. kubectl delete <component nane> <service name>
		e.g. kubectl delete deployment spk8s
	b stop minikube 
		minikube stop
	c. cleanup of cluster
		minikube delete
### Work with custom namespack
	a. Crate custom namespace 
		kubectl create namespace mamu
	b. Create deployment in a specific namespace, if you have create namespace already 
		kubectl create deployment spk8s --image=spk8s:1.0 -n=mamu 
	c. How to get deployment in custom namespace
		kubectl get deployments -n=mamu
	d. Delete namespace to free up all of its resource
		kubectl delete namespace mamu
### Create deployment.yml file and apply it
	a. Go to the path where your deployment.yml file is there and execute below command
		kubectl apply -f spk8s-deployment.yml
	b. Verify deploymnt created or not using below command
		kubectl get deployment
	c. How to create serice object
		kubectl apply -f spk8s-service.yml
	d. How to know my service url, execute below command, it will open your service url in browser with url like http://127.0.0.1:61614/
		minikube service spk8s 
	e. If you still face issue, execute below command and then execute command in d step 
		minikube tunnel
	