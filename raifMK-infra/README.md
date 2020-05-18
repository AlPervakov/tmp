# Развертывание инфраструктуры

Для развертывания инфраструктуры в GKE нужно создать кластер на 3 ноды standart2

Затем создать диск `mk-raif-disk` для хранения всякого (в той же зоне что и кластер):

> Диск можно не создавать вручную
```
gcloud compute disks create --size=25GB --zone=us-central1-a mk-raif-disk
```

Скопировать файлы:

- [bamboo-claim.yml](https://github.com/AlPervakov/tmp/blob/master/raifMK-infra/bamboo-claim.yml) запрос на выдачу - PersistentVolumeClaim для bamboo
- [bamboo-deployment.yaml](https://github.com/AlPervakov/tmp/blob/master/raifMK-infra/bamboo-deployment.yaml) деплоймент bamboo
- [mk-raif-volume.yml](https://github.com/AlPervakov/tmp/blob/master/raifMK-infra/mk-raif-volume.yml) описание PersistentVolume
- [svc.yaml](https://github.com/AlPervakov/tmp/blob/master/raifMK-infra/svc.yaml) сервис для подключения к bamboo

Запихать все это в кластер:

```
kubectl apply -f mk-raif-volume.yml #не треюуется

kubectl create -f bamboo-deployment.yaml

kubectl create -f bamboo-claim.yml

kubectl create -f svc.yaml
```
