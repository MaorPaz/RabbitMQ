
##Rabbitmq-Cluster Chart

This chart bootstraps a RabbitMQ deployment on a Kubernetes cluster using the Helm package manager.


##General
### StatefulSet

Unlike a Deployment, a StatefulSet maintains a sticky identity for each of their Pods.
These pods are created from the same spec, but are not interchangeable: each has a persistent identifier that it maintains across any rescheduling.

- Deleting and/or scaling a StatefulSet down will not delete the volumes associated with the StatefulSet!
- StatefulSets currently require a `Headless Service` to be responsible for the network identity of the Pods

#### Network ID
Each Pod in a StatefulSet derives its hostname from the name of the StatefulSet and the ordinal of the Pod.
The pattern for the constructed hostname is `$(statefulset name)-$(ordinal)`


#### Storage
`volume`
has an explicit lifetime - the same as the Pod that encloses it.

`A PersistentVolume (PV)`
It is a resource in the cluster just like a node is a cluster resource. lifecycle independent of any individual Pod that uses the PV.

`PersistentVolumeClaim (PVC)`
A request for storage, consume PV resources

PersistentVolumes associated with the Pods' PersistentVolume Claims are not deleted when the Pods, or StatefulSet are deleted. This must be done manually

