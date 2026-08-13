# Supabase Seed and Fixture Guidelines

## Absolute rule

Do not commit real production personal/sensitive data to seed files.

Use synthetic data.

## Synthetic fixture qualities

- plausible enough for UI/business testing;
- clearly fake names/emails/phones/addresses;
- stable IDs when deterministic tests require them;
- covers edge cases;
- no copy/paste from production records.

## Separation

Production migrations and development seed data have different purposes.

A production deployment must not depend on a development seed that inserts fake users/data.

## Sensitive domains

For HR, payroll, health, finance or children/minors:
- use obviously synthetic fixtures;
- avoid realistic combinations that could be mistaken for real people;
- document any anonymized-data process separately if truly required.
