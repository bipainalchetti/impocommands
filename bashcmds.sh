#Command to add branch name in linux shell
PS1='\[\e]0;\u@\h: \w\a\]\[\033[32m\]\u@\h \[\033[35m\]\w\[\033[00m\]$(git branch 2>/dev/null | grep "^*" | sed "s/* //") \$ '

#Command to create and label k8s namespace
kubectl create namespace my-namespace --dry-run=client -o yaml | kubectl apply -f - --namespace=my-namespace -l app=myapp
kubectl create namespace my-namespace --dry-run=client -o yaml | kubectl apply -f -


