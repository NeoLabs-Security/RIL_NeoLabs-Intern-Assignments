# Week 1 Baseline Log Report

## 1. Alert / Investigation Summary

Operation Night Watch — Week 1 baseline review of pod-03 telemetry.

## 2. Scope

- Pod: pod-03
- Scenario: w01-night-watch-baseline
- Environment: vcc-security-lab
- Traffic profile: quiet-learning
- Telemetry type: Synthetic training telemetry

## 3. Telemetry Observed

- 1 scenario start event
- 3 authentication events
- 2 session events
- 5 authorized application/API access events
- 1 scenario verification event
- Total: 12 events

## 4. Normal Authentication Pattern

One failed authentication was observed at 09:14:12 UTC.

The event was caused by invalid credentials and is identified in the telemetry as an ordinary baseline password mistype.

A successful authentication followed at 09:14:25 UTC.

## 5. Normal Application / API Pattern

Five successful authorization events were observed.

The activity involved normal access to:
- Profile
- Course catalogue
- Lesson list
- Lesson assets
- Lesson progress

## 6. Baseline Queries

Reference query-journal.md.

## 7. Normal Activity Timeline

Reference timeline.md.

## 8. Visibility Gaps

The dataset is a synthetic fallback replay pack rather than live production telemetry. It is sanitized/redacted and should be treated as training evidence. Telemetry is limited to synthetic API-level events, with no host, network, DNS, or firewall visibility. Authentication and session details are also limited, making deeper investigation of suspicious activity difficult.

## 9. Baseline Conclusion

The Week 1 baseline review of pod-03 telemetry showed normal, expected user activity within the training environment. The single failed login was consistent with a routine password mistype and was followed by successful authentication. No confirmed malicious or suspicious activity was identified.
