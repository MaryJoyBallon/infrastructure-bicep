# Introduction 

This Bicep module creates an **Azure Monitor Action Group** with support for **email** and **SMS** receivers. Action Groups are used to define who and how to notify when an alert is triggered in Azure.

Action Groups are essential components in Azure monitoring solutions, enabling automated notifications and actions in response to alert rules. By using this module, you can quickly deploy standardized Action Groups as part of your infrastructure-as-code deployments, ensuring consistent alerting and notification practices across your Azure environment.

This module is ideal for organizations looking to:
- Centralize alert notifications for critical resources.
- Automate the creation of Action Groups as part of CI/CD pipelines.
- Ensure compliance with organizational monitoring standards.
- Easily manage and update notification channels (email/SMS) via code.

> ⚠️ Currently supports **email and SMS** receivers only.

---

## 📦 Parameters

| Name                   | Type     | Description |
|------------------------|----------|-------------|
| `actionGroupName`      | `string` | The unique name of the Action Group resource. |
| `actionGroupShortName` | `string` | A short name (max 12 characters) used in notifications. |
| `emailReceivers`       | `array`  | An array of email receivers. |
| `smsReceivers`         | `array`  | An array of SMS receivers. |
| `enableActionGroup`    | `bool`   | Flag to enable or disable the Action Group. |
| `tags`                 | `object` | Optional tags to assign to the resource. |

---
