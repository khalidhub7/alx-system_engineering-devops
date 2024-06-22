🍂 Postmortem 🍂
Postmortem Report: Web Stack Outage 🚨
____________________________________________________________________

Issue Summary
Duration of Outage: June 20, 2024, 10:00 AM - 12:30 PM (PST) ⏰

Impact: Our main shopping site was down, stopping users from making purchases. About 75% of users were affected. 😱

Root Cause: A wrong setting in the database connection pool caused the database to overload, leading to a system crash. 🛠️

![wallpaperflare com_wallpaper](https://github.com/khalidhub7/alx-system_engineering-devops/assets/139714446/fed6cf47-dfbb-4cb9-a96c-8b8399075714)

Timeline
10:00 AM: Issue detected by monitoring system showing high error rates. 🚨
10:05 AM: Engineering team notified via PagerDuty. 📟
10:10 AM: Initial investigation focused on web server, assuming traffic spike. 🌐
10:30 AM: Realized web server was fine, switched focus to the database. 🔍
10:45 AM: Checked database logs, saw high connection counts. 📊
11:00 AM: Suspected database connection pool misconfiguration. ❓
11:15 AM: Misleading check for potential DDoS attack found nothing. 🕵️
11:30 AM: Escalated to senior database admin. 📞
11:45 AM: Fixed connection pool settings. ✅
12:00 PM: Restarted database, monitored connections. 🔄
12:30 PM: Service fully restored. 🎉

Root Cause and Resolution
Root Cause: The database connection pool was set up wrong, allowing too few connections. This caused the database to crash under heavy use. 😓

Resolution: We fixed the issue by increasing the maximum number of database connections. After changing the settings, we restarted the database, and everything went back to normal. 🔧

Corrective and Preventative Measures
Improvements/Fixes:

Improve how we manage database settings. 📋
Better monitoring to catch connection issues early. 🚀
Regular load tests to ensure settings handle peak times. 🧪

![wallpaLLperflare com_wallpaper](https://github.com/khalidhub7/alx-system_engineering-devops/assets/139714446/f5d027ad-fae2-4975-adf4-c9e9fe8d8543)

TODO List:

Fix Database Connection Settings:
Review and adjust connection limits. 🛠️
Improve Monitoring:
Add alerts for database connection issues. 🔔
Conduct Load Testing:
Schedule regular tests to check connection settings. 📈
Update Documentation:
Document the correct settings and procedures. 📚
Training:
Train the team on managing database connections and using monitoring tools. 🎓
Conclusion
By fixing the root cause and improving our processes, we aim to prevent this from happening again. This postmortem shows the importance of good configuration and monitoring. Thanks to the team for quickly solving the problem. We'll keep working to improve our service. 🌟
