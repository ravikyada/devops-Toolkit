***Scale All the deployments of the single namespace to Specific Number. Useful when wants to Scale diffrent environments.***
 
```kubectl scale deploy -n dev --replicas=3 --all```

***Edit HPA For the Whole Namespace with Single liner:***

```
for deployment in $(kubectl get deployments -o jsonpath='{.items[*].metadata.name}' -n <namespace>); do
    kubectl autoscale deployment $deployment --min=<min-replicas> --max=<max-replicas> --cpu-percent=<cpu-percent>
done
```

***List the Ingresses with the specific group-name in whole cluster***

```kubectl get ingresses --all-namespaces -o json | jq '.items[] | select(.metadata.annotations."alb.ingress.kubernetes.io/group.name" == "g-name") | {namespace: .metadata.namespace, name: .metadata.name}'```   

***Fetch Only Domain names from the List of Long long Ingresses***

```kubectl get ingress -n <namespace> <Ingress-Name> -o jsonpath='{.spec.rules[*].host}' | tr ' ' '\n' | grep 'domain.com' ```   


**Get Pods Schedules to Node with specific lables**

```
for NODE_NAME in $(kubectl get nodes --selector="eks.amazonaws.com/capacityType=SPOT" -o jsonpath='{.items[*].metadata.name}'); do
    kubectl get pods -n production -o wide --field-selector=spec.nodeName=${NODE_NAME}
done
```

```
for NODE_NAME in $(kubectl get nodes --selector="eks.amazonaws.com/capacityType=SPOT" -o jsonpath='{.items[*].metadata.name}'); do
    echo "========== Node: ${NODE_NAME} =========="
    kubectl get pods -n production --selector=app=deployment-name -o wide --field-selector=spec.nodeName=${NODE_NAME}
    echo " "
done
```

***Get ALl of the Decrypted values of Kubernrtes Secrets***
```
kubectl get secret secret-name -o go-template='
{{range $k,$v := .data}}{{printf "%s: " $k}}{{if not $v}}{{$v}}{{else}}{{$v | base64decode}}{{end}}{{"\n"}}{{end}}'
```