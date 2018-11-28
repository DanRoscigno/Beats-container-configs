# Beats-container-configs

### File Structure
#### hint-configs

    These configs use the annotation or label based autodiscover feature
#### match-configs

    These configs use the match or regex based autodiscover feature
#### sample-app

    This is a PHP / Redis app that I use for testing, the containers have labels added that are used with the hint based autodiscover feature of Filebeat and Metricbeat

#### single-configs

    Some Beats are not configured with autodiscover, their configs are in here

#### step-xx-*.sh

    These are the commands that run the setup (index patterns, dashboards, ML job loads, etc.)
