
To apply for maintainership, you must fulfill the following requirements first:

 [**Device requirements**](https://github.com/lighthouse-os/official_devices/blob/raft/device_requirements.md)   
 
 [**Kernel guidelines**](https://github.com/lighthouse-os/official_devices/blob/raft/kernel_guidelines.md)

 [**Maintainers' code of conduct**](https://github.com/lighthouse-os/official_devices/blob/raft/maintainers_code_of_conduct.md)

 [**Maintainers requirements**](https://github.com/lighthouse-os/official_devices/blob/raft/maintainers_requirements.md)


If you agree with everything, please [fill this form](https://github.com/lighthouse-os/official_devices/issues/new/choose)

**Initial Support**

1. Fork this repo to your own GitHub
2. Copy file **createjson.sh** to Lighthouse source folder and make it executable
```
chmod +x createjson.sh
```
3. Open the file in a text editor (vim, nano, any GUI editor) and make changes from where it states *#modify values below*, save the file then run the generation script with below command
```
./createjson.sh
```
4. A file named *codename*.json gets created in main Lighthouse source folder. Copy it to the builds folder where this repo was cloned.
5. A file named changelog_*codename*.txt gets created in the main Lighthouse source folder , add your device side changelogs and copy it to the changelogs/*codename/ folder where this repo was cloned.
6. Make sure to validate your json using https://jsonlint.com/ or any similar tool.
7. Submit a pull request to this repo with your changes.