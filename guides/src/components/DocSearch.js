import * as React from 'react'
import PropTypes from 'prop-types'
import { cx } from 'emotion'

import IconSearch from 'react-feather/dist/icons/search'

export default class DocSearch extends React.Component {
  static propTypes = {
    isOpen: PropTypes.bool.isRequired
  }

  state = {
    enabled: true
  }

  componentDidMount() {
    // Initialize Algolia search.
    if (window.docsearch) {
      window.docsearch({
        apiKey: 'fb697cd2d04591b036ea172259c05ba8',
        indexName: 'spreecommerce',
        inputSelector: '#algolia-doc-search'
      })
    } else {
      console.warn('Search has failed to load and now is being disabled')
      this.setState({ enabled: false })
    }
  }

  render() {
    const { enabled } = this.state

    return enabled ? (
      <form
        css={{
          '& > .algolia-autocomplete': {
            position: 'static !important',
            width: '100%'
          }
        }}
        className={cx(
          { 'db absolute left-0': this.props.isOpen },
          { dn: !this.props.isOpen },
          `ml4-l pr0-l ph3 relative db-l w-100 w-auto-l`
        )}
      >
        <IconSearch className="absolute z-999 top-0 mt2 pt1 ml3 moon-gray" />
        <input
          className={cx(
            { 'w-100': this.props.isOpen },
            'pv3 pr3 w6 ba b--moon-gray'
          )}
          id="algolia-doc-search"
          type="search"
          placeholder="Search docs..."
          aria-label="Search docs"
          css={{
            paddingLeft: '3rem'
          }}
        />
      </form>
    ) : null
  }
}
