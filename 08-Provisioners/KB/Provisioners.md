**DAY 8**
---

**1. What Are Provisioners?**  

Provisioners are **small helpers** in Terraform that **allow you to run scripts or commands after a resource is created**.  

They let Terraform:  
- Run commands on your **local machine**    
- Run commands **inside a VM (via SSH/WinRM)**    
- **Upload** files to a VM  

Important: HashiCorp says provisioners should be used only as a last resort.  

**2. Why Are Provisioners Not Recommended?**  

Because:  
- They **break Terraform’s idea of declarative (desired-state)** infrastructure.   
- They depend on outside systems → can fail randomly (SSH, network, firewall).  
- Harder to maintain and troubleshoot.  
- Can produce **inconsistent states if provisioning fails midway**.  
- Use them only when no better option exists.  
---

**3. Types of Provisioners in Terraform**  

**A. local-exec**  

Runs a command on your local machine (where Terraform is running).  
Example uses:  
- Notify a webhook 
- Run a local script
- Creating log files

Example:
<pre>
provisioner "local-exec" {
  command = "echo VM created!"
}
</pre>
---
**B.remote-exec**  

Runs commands inside the VM (Linux → SSH, Windows → WinRM).  
Example uses:  
- Install software (nginx, apache)  
- Configure OS  
- Execute shell or PowerShell scripts  

Example:
<pre>
provisioner "remote-exec" {
  inline = ["sudo apt update -y"]
}
</pre>
---
**C.file Provisioner**  

**Uploads a file from local to the VM.**  
  
Example uses:  
- Copy a configuration file  
- Upload index.html to a web server directory  
- Transfer secrets temporarily (not recommended)  

Example:  
<pre>
provisioner "file" {
  source      = "app.conf"
  destination = "/etc/app/app.conf"
}
</pre>

---


