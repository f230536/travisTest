#!/bin/bash
# For chrome
lettuce -v 3 features/simple.feature chrome desktop-s
lettuce -v 3 features/simple.feature chrome desktop-m
lettuce -v 3 features/simple.feature chrome desktop-l

lettuce -v 3 features/simple.feature chrome mobile-s
lettuce -v 3 features/simple.feature chrome mobile-m
lettuce -v 3 features/simple.feature chrome mobile-l
lettuce -v 3 features/simple.feature chrome mobile-xl

# For Firefox
# - lettuce -v 3 features/simple.feature chrome desktop-m
