# Postmortem: Web Application Outage on web-01
Date of Incident: August 15, 2024
Prepared by: [Your Name]
Date of Postmortem: August 19, 2024

Issue Summary
Duration:
The outage occurred on August 15, 2024, from 14:00 to 15:30 UTC, lasting 1 hour and 30 minutes.

Impact:
During the outage, our web application experienced significant downtime, causing 80% of our users to be unable to access the service. Users encountered a "504 Gateway Timeout" error when attempting to load the site.

Root Cause:
The root cause of the outage was an unpatched Nginx server that reached its memory limit, leading to a failure in handling incoming HTTP requests.

Timeline
14:00 UTC - The issue was first detected via a Datadog monitoring alert indicating high memory usage on web-01.
14:05 UTC - The on-call engineer noticed an increase in HTTP 504 errors in the application logs.
14:10 UTC - Initial investigation focused on the load balancer, suspecting it was misrouting traffic.
14:20 UTC - Misleading path: The team assumed a DDoS attack and began analyzing traffic patterns.
14:30 UTC - Further investigation revealed that the Nginx server on web-01 was consuming excessive memory.
14:40 UTC - The incident was escalated to the DevOps team for a deeper investigation.
14:50 UTC - The DevOps team identified that the Nginx server had not been updated to handle a recent increase in traffic.
15:00 UTC - The team applied a temporary fix by restarting the Nginx service to clear memory usage.
15:30 UTC - The issue was fully resolved by patching the Nginx server and increasing its memory limit.
Root Cause and Resolution
Root Cause:
The Nginx server on web-01 had not been updated to handle the recent surge in traffic following a marketing campaign. The server's memory limit was exceeded, causing it to fail in processing HTTP requests, resulting in a "504 Gateway Timeout" error for users.

Resolution:
The issue was resolved in two stages:

A temporary fix was applied by restarting the Nginx service to clear memory usage and restore service.
The Nginx server was patched and its memory limit was increased to prevent future occurrences of this issue.
Corrective and Preventative Measures
Improvements:

Implement regular patch management for all servers to ensure they are up-to-date.
Enhance monitoring to include alerts for server memory usage thresholds, allowing for proactive management.
Tasks:

Patch Nginx server to the latest version on all environments.
Add monitoring for server memory usage and set alerts at 70% of the limit.
Conduct a load test simulating the expected increase in traffic to ensure server stability.
Update incident response documentation to include memory usage checks in the initial investigation steps.