
# 🧠 Time Drift & Log Correlation Lab (A+ Certification / Hackerspace Edition)

Welcome to the **Time Drift Chaos Lab** — a hands-on simulation of what happens when clocks go out of sync in a real network. Students will explore how mismatched timestamps affect authentication, logging, and even TLS.

---

## 🧪 Lab Modules

### 1. 🔥 Time Drift & Rsyslog (Ubuntu / Vagrant)
- 3 VMs: `logserver`, `client1`, `client2`
- client1 sends logs with correct time
- client2 has NTP disabled and time offset (e.g., +5 minutes)
- Logs are sent to logserver using `rsyslog`
- Students observe logs out of order

### 2. 🧑‍💻 Kerberos Auth Failures (Windows)
- Windows Server 2019 + Windows 10 client
- Join domain: `a-lab.local`
- Offset client time by >5 mins
- Kerberos login fails with 0xC0000133

### 3. 🔐 TLS Failures from Skewed Time
- Change system date to past/future
- Visit HTTPS site (e.g., https://example.com)
- Observe `NET::ERR_CERT_DATE_INVALID` or cert error

---

## 🎯 Learning Objectives

- Understand NTP and why it's critical
- Observe how time affects logging, TLS, and auth
- Learn how to fix time-related issues on Linux and Windows
- Practice troubleshooting failed logins or alerts

---

## 🎓 Student Challenges

### ✅ Challenge 1: Find the Time Drift
> Look at `/var/log/client1/sudo.log` and `/var/log/client2/sudo.log`. Which system is ahead of the other?

**Answer Key:** client2 is ahead by ~5 minutes due to manual offset in `client2.sh`.

---

### ✅ Challenge 2: Fix the Time on client2
> Use NTP tools to fix the time on client2 and sync it with the logserver.

**Answer Key:**
```bash
timedatectl set-ntp true
sudo apt install ntp
sudo systemctl restart ntp
```

---

### ✅ Challenge 3: Explain Kerberos Failure
> Why does Kerberos authentication fail when the client clock is wrong?

**Answer Key:**
Kerberos tickets are timestamped and valid for a window (usually ±5 minutes). A skew beyond this range causes the DC to reject the ticket (`0xC0000133` error).

---

### ✅ Challenge 4: Break TLS
> Change your system time and visit a site like https://example.com. What happens?

**Answer Key:**
If the system time is before or after the certificate's validity window, the browser throws a TLS cert error.

---

## 📦 Downloads

| Resource                                              | Description |
|-------------------------------------------------------|-------------|
| [Lab Guide PDF](docs/time_drift_lab_guide.pdf)        | Full walkthrough with recovery steps |
| [Kerberos Lab PDF](docs/kerberos_time_drift_lab.pdf)  | Domain login failure scenario |
| [TLS Clock Skew Lab PDF](docs/tls_clock_skew_lab.pdf) | HTTPS failure demo |
| [Log Diagram](docs/log_correlation_diagram.pdf)       | ASCII timeline showing drift |

---

## 🔁 Reset Commands

### Linux
```bash
sudo timedatectl set-ntp true
sudo ntpdate pool.ntp.org
```

### Windows
```cmd
w32tm /config /manualpeerlist:"192.168.56.10" /syncfromflags:manual /update
w32tm /resync
```

---

## 🛠️ Built with ❤️ by Kei Nova for hands-on security education.
