cask "binlogviz" do
  version "0.17.0"

  on_macos do
    on_intel do
      sha256 "bc846ce538901fcafe7b45f2dfbc3cd7c8c4ff2f939c24a86a96bada3d04d033"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.17.0/binlogviz_0.17.0_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "47860a46646a583072f7a69beb15fd6299a4693fb1f549ce2ec6111fe4e935fd"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.17.0/binlogviz_0.17.0_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "28deb3bf7b726c410b0f75fd9d2e325c72e8a38b767b14748ee942296f1baa5e"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.17.0/binlogviz_0.17.0_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "5fa105ea0886cf5b856e9d3bb7201d2babfa6c1cb7aa1f51dd4eaf815d33685f"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.17.0/binlogviz_0.17.0_linux_arm64.tar.gz",
            verified: "github.com/Fanduzi/BinlogVisualizer/"
      end
    end
  end

  name "BinlogViz"
  desc "Local CLI for MySQL ROW binlog analysis"
  homepage "https://github.com/Fanduzi/BinlogVisualizer"

  binary "binlogviz"

  postflight do
    if OS.mac?
      system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", staged_path/"binlogviz"]
    end
  end
end
