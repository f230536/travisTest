Feature: highschool student home page
    Scenario: Go to essay-home and wait 5 to see the become guru button is shown
        I start the args browser with args size
        I visit "http://localhost:8100/#/essay-home"
            And wait 7 seconds
        I verify that the element with css selector "#essay-home-banner" has a class " show"
     #   I click the element with css selector "#become-guru-essay-header a"
            And wait 1 seconds
      #  I click the element with css selector "[name='university-head-back']"
        I click the element with css selector "[name='guru-essay-hdeader-close']"

    Scenario Outline: Scroll button [0-4]
        I click the element with css selector "<scrollTo>"
            And wait 1 seconds
        I check element "<checkmarks>" position is at 0,0
           Examples:
             | scrollTo                 | checkmarks         |
             | [name='faq-scroll']      | #essay-faq         |
             | [name='price-scroll']    | #essay-pricing     |
             | [name='how-scroll']      | #essay-how-it-works|
             | [name='faq-scroll']      | #essay-faq         |

    Scenario Outline: Modal checks [0-3]
        I click the element with css selector "[name='price-scroll']"
            And wait 1 seconds
        I check element "#essay-pricing" position is at 0,0
        I click the element with css selector "<modal>"
            And wait 1 seconds
        I verify that the element with css selector ".loading-container" has a class "active"
           Examples:
             | modal                        |  checkmarks         |
             | [name='support-loader']       |                     |
             | [name='budget-loader']        |                     |
             | [name='sophisticated-loader'] |                     |

    Scenario: After refresh the page, the home-banner will not show
        I refresh browser
            And wait 7 seconds
        I verify that the element with css selector "#essay-home-banner" should not " show"