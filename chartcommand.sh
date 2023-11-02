#1. check kubernetes service
kubectl get all 
#2. create a helm chart
helm create springboot
#3. check helm chart structure look like
tree springboot
#4. check Chart.yaml
cat Chart.yaml
#5. edit some values
vim values.yaml
#6. edit repository to your repository url from docker hub 
line 8: repository: samboleap/simplenmavenspringimg:1.1.0
#7. edit your port 
line 41: port: 8000
#8. edit your host
line 49: myspringboot.samboleap.com
#9. edit some configuration in deployment.yaml
vim deployment.yaml
#10. delete the tags and name image 
line 34: image: "{{ .Values.image.repository }}:{{ .Values.image.tag | default .Chart.AppVersion }}"
#11. command the liveness probe and readiness probe which is the test of liveliness of any application which you deploy  
line 40-47: 
          # livenessProbe:
          #   httpGet:
          #     path: /
          #     port: http
          # readinessProbe:
          #   httpGet:
          #     path: /
          #     port: http
#12. Run command helm template that use to view our actual yaml how it would look like 
helm template springboot
#13. Run command helm lint that use to identify possible issues forehand
helm lint springboot
#14. Run command helm debug springboot that use to verify your spring boot helm chart
helm install springboot --debug --dry-run springboot
#15. Run command helm install springboot that use to install all instance that needed and run the application
helm install myspringboot springboot
#16. Run command helm list that use to list the helm install
helm list -a
#17. Command to update the helm that release 
helm upgrade myspringboot springboot
#18. Command to rollback the helm that release with the version 
#Example :
#NAME            NAMESPACE       REVISION        UPDATED                                 STATUS        CHART                   APP VERSION
#myspringboot    default         5               2023-11-02 19:26:16.971849866 +0000 UTC deployed      springboot-0.1.0        1.16.0
helm rollback myspringboot 1
#19. Command to delete the helm that release 
helm delete myspringboot 