#Command to add branch name in linux shell
PS1='\[\e]0;\u@\h: \w\a\]\[\033[32m\]\u@\h \[\033[35m\]\w\[\033[00m\]$(git branch 2>/dev/null | grep "^*" | sed "s/* //") \$ '

#Command to create and label k8s namespace
kubectl create namespace my-namespace --dry-run=client -o yaml | kubectl apply -f - --namespace=my-namespace -l app=myapp
kubectl create namespace my-namespace --dry-run=client -o yaml | kubectl apply -f -


#Yaml Key check


To verify that specific YAML keys are present in all environment-specific YAML files using a shell script, you can use tools like `yq` and `jq` to parse and check the YAML files. Here's a basic shell script that does this:

```bash
#!/bin/bash

# Define the YAML keys you want to check
keys=("key1" "key2" "key3")

# Define the environment-specific YAML files
files=("file1.yaml" "file2.yaml" "file3.yaml")

for file in "${files[@]}"; do
  echo "Checking $file..."
  for key in "${keys[@]}"; do
    # Use yq to extract the value associated with the key from the YAML file
    value=$(yq eval ".$key" "$file")
    
    # Check if the key exists in the YAML file
    if [ -z "$value" ]; then
      echo "Key '$key' not found in $file."
    else
      echo "Key '$key' found with value: $value"
    fi
  done
done
```

In this script:

1. Replace `keys` with the YAML keys you want to verify.
2. Replace `files` with the names of your environment-specific YAML files.
3. The script iterates through each file and each key, using `yq` to extract the value associated with the key.
4. If the key doesn't exist (i.e., the value is empty), it prints a message indicating that the key was not found. Otherwise, it prints the key and its associated value.

Make sure you have `yq` and `jq` installed on your system. You can install `yq` using a package manager like `brew` (on macOS) or `apt-get` (on Ubuntu), and `jq` is commonly available as well.

Remember to make the script executable with `chmod +x script.sh` and then run it with `./script.sh`.
