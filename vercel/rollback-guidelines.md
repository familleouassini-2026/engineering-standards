# Vercel Rollback / Recovery Guidelines

Application rollback is only one part of recovery.

A prior application deployment may be incompatible with a newly migrated database.

For every risky release, decide:

- Can the application be redeployed to the previous version safely?
- Is the DB migration backward compatible?
- Is a forward-fix safer than reversing the migration?
- Are environment-variable changes reversible?
- What post-rollback validation is required?

Document the exact recovery path for high-impact changes.
