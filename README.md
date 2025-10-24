# 🖥️ Enable Hyper-V on Windows Home

This batch script enables **Hyper-V** on **Windows 10/11 Home Edition**, where it’s normally disabled by default.  
It performs automatic system checks, verifies BIOS virtualization, and installs all required Hyper-V components safely with real-time progress updates.

---

## ⚙️ Features
- ✅ Detects Windows version and admin permissions  
- ✅ Checks if hardware virtualization (VT-x / AMD-V) is enabled  
- ✅ Installs all Hyper-V packages silently via DISM  
- ✅ Displays live progress for each installation step  
- ✅ Automatically enables the full Hyper-V platform  
- ✅ Clear and user-friendly console output  

---

## 🪄 Usage
1. **Download or copy** the `Enable-HyperV-Home-Clean.bat` script.  
2. **Right-click → Run as Administrator.**  
3. Wait 5–15 minutes while the installation completes.  
4. When prompted, **restart your PC.**  
5. Open **Start → Hyper-V Manager** to verify installation.

---

## ⚠️ Requirements
- Windows **10 or 11 Home Edition** (64-bit)  
- **Virtualization enabled** in BIOS/UEFI (Intel VT-x or AMD-V)  
- At least **4 GB of RAM** recommended  

---

## 🧰 Notes
- This script uses built-in Windows packages — **no downloads or external tools** required.  
- If you already have Windows Pro or Enterprise, use the official method instead (`optionalfeatures` → enable Hyper-V).  
- Run this script **only once**; re-running isn’t necessary after a successful setup.

---

## 🧑‍💻 Author
**Enable-HyperV-Home-Clean.bat** — created for users who want to run Linux, Docker, or virtual machines on Windows Home safely and easily.
