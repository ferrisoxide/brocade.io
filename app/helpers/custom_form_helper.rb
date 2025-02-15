# frozen_string_literal: true

require 'tailwind_merge'

# Custom FormBuilder adding Tailwind classes to form fields.
class CustomFormBuilder < ActionView::Helpers::FormBuilder # rubocop:disable Metrics/ClassLength
  BASE_COLOR_CLASSES = %w[
    bg-red-500
    bg-orange-500
    bg-amber-500
    bg-yellow-500
    bg-lime-500
    bg-green-500
    bg-emerald-500
    bg-teal-500
    bg-cyan-500
    bg-sky-500
    bg-orange-500
    bg-indigo-500
    bg-violet-500
    bg-purple-500
    bg-fuchsia-500
    bg-pink-500
    bg-rose-500
  ].freeze

  BASE_COLOR_SELECT_DATA_ATTRIBUTES = {
    action: 'base-color-select#change',
    base_color_select_target: 'select'
  }.freeze

  OPTIONS_FOR_BASE_COLOR_SELECT =
    BASE_COLOR_CLASSES.map do |color_class|
      color_name = color_class.split('-').second
      [color_name.capitalize, color_name, { class: color_class }]
    end

  # rubocop:disable Layout/LineLength
  CHECK_BOX_CLASS = 'h-4 w-4 rounded border-gray-300 text-indigo-600 focus:ring-indigo-600'
  SUBMIT_BUTTON_CLASS = 'rounded-md bg-zinc-950 dark:bg-zinc-600 px-3 py-2 text-sm font-semibold text-white shadow-sm hover:bg-zinc-400 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-zinc-500'

  COMMON_FIELD_CLASS = 'block w-full rounded-md border-0 py-1.5 text-gray-900 dark:text-white shadow-sm ring-1 ring-inset ring-gray-300 sm:text-sm sm:leading-6'

  TEXT_FIELD_CLASS = "#{COMMON_FIELD_CLASS} bg-white/5 bg-opacity-5 placeholder:text-gray-400 dark:ring-white/10 focus:ring-2 focus:ring-inset focus:ring-orange-500".freeze

  TEXT_AREA_CLASS = "#{COMMON_FIELD_CLASS}  bg-white/5 bg-opacity-5 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-orange-500".freeze

  SELECT_FIELD_CLASS = "#{COMMON_FIELD_CLASS} block w-full rounded-md border-0 bg-white/5 shadow-sm ring-1 focus:ring-2 focus:ring-inset focus:ring-orange-500 sm:text-sm/6 [&_*]:text-black".freeze

  # TEXT_FIELD_CLASS = 'block w-full rounded-md border-0 bg-white/5 py-1.5 text-gray-900 dark:text-white shadow-sm ring-1 ring-inset ring-gray-300 dark:ring-white/10 focus:ring-2 focus:ring-inset focus:ring-yellow-500 sm:text-sm sm:leading-6'
  # TEXT_AREA_CLASS = 'block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-yellow-600 sm:text-sm sm:leading-6'
  # SELECT_FIELD_CLASS = 'mt-2 block w-full rounded-md border-0 py-1.5 pl-3 pr-10 text-gray-900 ring-1 ring-inset ring-gray-300 focus:ring-2 focus:ring-yellow-500 sm:text-sm sm:leading-6'

  ERROR_BORDER_CLASS = 'border-2 border-red-500'
  LABEL_CLASS = 'block text-sm font-medium leading-6 text-gray-900 dark:text-white'

  MULTI_SELECT_DEFAULT_HS_SELECT = {
    placeholder: 'Select multiple options...',
    toggleTag: '<button type="button" aria-expanded="false"></button>',
    toggleClasses: 'hs-select-disabled:pointer-events-none hs-select-disabled:opacity-50 relative py-3 ps-4 pe-9 flex gap-x-2 text-nowrap w-full cursor-pointer bg-white border border-gray-200 rounded-lg text-start text-sm focus:outline-none focus:ring-2 focus:ring-orange-500 dark:bg-neutral-900 dark:border-neutral-700 dark:text-neutral-400 dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-neutral-600',
    toggleSeparators: {
      betweenItemsAndCounter: '&'
    },
    toggleCountText: 'selected',
    toggleCountTextMinItems: 3,
    toggleCountTextMode: 'nItemsAndCount',
    dropdownClasses: 'mt-2 z-50 w-full max-h-72 p-1 space-y-0.5 bg-white border border-gray-200 rounded-lg overflow-hidden overflow-y-auto [&::-webkit-scrollbar]:w-2 [&::-webkit-scrollbar-thumb]:rounded-full [&::-webkit-scrollbar-track]:bg-gray-100 [&::-webkit-scrollbar-thumb]:bg-gray-300 dark:[&::-webkit-scrollbar-track]:bg-neutral-700 dark:[&::-webkit-scrollbar-thumb]:bg-neutral-500 dark:bg-neutral-900 dark:border-neutral-700',
    optionClasses: 'hs-selected:block py-2 px-4 w-full text-sm text-gray-800 cursor-pointer hover:bg-gray-100 rounded-lg focus:outline-none focus:bg-gray-100 dark:bg-neutral-900 dark:hover:bg-neutral-800 dark:text-neutral-200 dark:focus:bg-neutral-800',
    optionTemplate: '<div class="flex justify-between items-center w-full"><span data-title></span><span data-icon class="hidden hs-selected:block"><svg class="shrink-0 size-3.5 text-orange-600 dark:text-orange-500 " xmlns="http:.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="20 6 9 17 4 12"/></svg></span></div>',
    extraMarkup: '<div class="absolute top-1/2 end-3 -translate-y-1/2"><svg class="shrink-0 size-3.5 text-gray-500 dark:text-neutral-500 " xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="m7 15 5 5 5-5"/><path d="m7 9 5-5 5 5"/></svg></div>'
  }.freeze
  # rubocop:enable Layout/LineLength

  def check_box(method, options = {}, checked_value = '1', unchecked_value = '0')
    default_opts = { class: build_default_field_class(CHECK_BOX_CLASS, ERROR_BORDER_CLASS, method) }
    merged_opts = default_opts.merge(options)

    @template.content_tag(:div) do
      @template.concat(super(method, merged_opts, checked_value, unchecked_value))
      append_error_message(@object, method)
    end
  end

  def collection_select(method, collection, value_method, text_method, options = {}, html_options = {}) # rubocop:disable Metrics/ParameterLists
    default_html_options = { class: build_default_field_class(SELECT_FIELD_CLASS, ERROR_BORDER_CLASS, method) }
    merged_html_options = default_html_options.merge(html_options)

    @template.content_tag(:div) do
      @template.concat(super(method, collection, value_method, text_method, options, merged_html_options))
      append_error_message(@object, method)
    end
  end

  def date_field(method, options = {})
    default_opts = { class: build_default_field_class(TEXT_FIELD_CLASS, ERROR_BORDER_CLASS, method) }
    merged_opts = default_opts.merge(options)

    @template.content_tag(:div) do
      @template.concat(super(method, merged_opts))
      append_error_message(@object, method)
    end
  end

  def label(method, content_or_options = nil, options = {}, &)
    options_class = content_or_options.is_a?(Hash) ? content_or_options.delete(:class) : options.delete(:class)
    label_class = tailwind_merge(LABEL_CLASS, options_class)
    default_opts = { class: label_class }
    merged_opts = default_opts.merge(options)
    super(method, content_or_options, merged_opts, &)
  end

  def multi_select(method, choices = nil, options = {}, html_options = {}, &)
    placeholder = options.delete(:placeholder) || 'Select multiple options...'
    hs_select = MULTI_SELECT_DEFAULT_HS_SELECT.merge(placeholder:).to_json

    options.merge!(multiple: true)
    data_options = html_options.delete(:data) || {}
    html_options.merge!(data: data_options.merge({ multi_select_target: 'select', hs_select: }), class: 'hidden')

    @template.content_tag(:div, data: { controller: 'multi-select' }) do
      @template.concat(ActionView::Helpers::Tags::Select.new(
        @object, method, @template, choices, options, html_options, &
      ).render)
    end
  end

  def select(method, choices = nil, options = {}, html_options = {}, &)
    default_html_options = { class: build_default_field_class(SELECT_FIELD_CLASS, ERROR_BORDER_CLASS, method) }
    merged_html_options = default_html_options.merge(html_options)

    @template.content_tag(:div) do
      @template.concat(super(method, choices, options, merged_html_options, &))
      append_error_message(@object, method) if @object.present?
    end
  end

  def submit(value = nil, options = {})
    default_opts = { class: SUBMIT_BUTTON_CLASS }
    merged_opts = default_opts.merge(options)
    super(value, merged_opts)
  end

  def text_area(method, options = {})
    options_class = options.delete(:class)
    text_area_class = tailwind_merge(TEXT_AREA_CLASS, options_class)

    default_opts = { class: build_default_field_class(text_area_class, ERROR_BORDER_CLASS, method) }
    merged_opts = default_opts.merge(options)

    @template.content_tag(:div) do
      @template.concat(super(method, merged_opts))
      append_error_message(@object, method)
    end
  end

  def text_field(method, options = {})
    options_class = options.delete(:class)
    text_field_class = tailwind_merge(TEXT_AREA_CLASS, options_class)

    default_opts = { class: build_default_field_class(text_field_class, ERROR_BORDER_CLASS, method) }
    merged_opts = default_opts.merge(options)

    @template.content_tag(:div) do
      @template.concat(super(method, merged_opts))
      append_error_message(@object, method)
    end
  end

  def base_color_select(method, options = {}, html_options = {}, &)
    field_classes = "#{SELECT_FIELD_CLASS} bg-#{@object.send(method)}-500"
    default_html_options = {
      class: build_default_field_class(field_classes, ERROR_BORDER_CLASS, method),
      data: BASE_COLOR_SELECT_DATA_ATTRIBUTES
    }
    merged_html_options = default_html_options.merge(html_options)

    @template.content_tag(:div, data: { controller: 'base-color-select' }) do
      select(method, OPTIONS_FOR_BASE_COLOR_SELECT, options, merged_html_options, &)
    end
  end

  private

  def append_error_message(object, method)
    return unless object.errors[method].any?

    object.errors[method].each do |error_message|
      @template.concat(
        @template.content_tag(:div, class: 'h-2 mt-2 mb-4 text-xs text-red-500 dark:text-red-500') do
          error_message.html_safe # rubocop:disable Rails/OutputSafety
        end
      )
    end
  end

  def build_default_field_class(base_class, error_class, method)
    return if @object.blank?

    base_class + (@object.errors[method].any? ? " #{error_class}" : '')
  end

  def tailwind_merge(base_classes, override_classes)
    TailwindMerge::Merger.new.merge([base_classes, override_classes])
  end
end
