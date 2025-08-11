CREATE TABLE prod (
    jira_date DATE,
    jira_id VARCHAR(20) PRIMARY KEY,
    jira_policy VARCHAR(100),
    jira_offender VARCHAR(50),
    jira_status VARCHAR(50)
);

## Tickets by Status ##

SELECT jira_status, COUNT(*) AS total_tickets
FROM prod
GROUP BY jira_status
ORDER BY total_tickets DESC;

## Monthly Ticket Trend ##

SELECT DATE_FORMAT(jira_date, '%Y-%m') AS month, COUNT(*) AS total_tickets
FROM prod
GROUP BY month
ORDER BY month;

## Top 3 Offenders ##

SELECT jira_offender, COUNT(*) AS total_violations
FROM prod
GROUP BY jira_offender
ORDER BY total_violations DESC
LIMIT 3;

## Policy Violation Count ##

SELECT jira_policy, COUNT(*) AS violation_count
FROM prod
GROUP BY jira_policy
ORDER BY violation_count DESC;

## Repeat Offenders ##

SELECT jira_offender, COUNT(*) AS ticket_count
FROM prod
GROUP BY jira_offender
HAVING ticket_count > 200
ORDER BY ticket_count DESC;