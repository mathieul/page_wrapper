window.PageWrapper ?= {}
PageWrapper.PaginationView = Ember.View.extend
  tagName:       'div'
  classNames:    ['pagination pagination-right']
  template: Ember.Handlebars.compile """
    {{#if view.page.isLoaded}}
      {{#with view.page}}
        {{#if paginated}}
          <ul>
            {{#each paginationItems}}
              <li {{bindAttr class="active disabled"}}>
                {{#if disabled}}
                  <a href="javascript:void(0)">{{value}}</a>
                {{else}}
                  <a href="#" {{bindAttr data-page="page"}}
                     {{action changePage}}>{{value}}</a>
                {{/if}}
              </li>
            {{/each}}
          </ul>
        {{/if}}
        <div class="pagination-info">
          Showing {{itemsName}} <code>{{from}} to {{to}}</code> out of <code>{{total}}</code>
        </div>
      {{/with}}
    {{/if}}
  """
