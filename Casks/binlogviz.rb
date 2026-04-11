cask "binlogviz" do
  version "0.15.0"

  on_macos do
    on_intel do
      sha256 "533d0d4842c6c6b218842ff0a053190afd26b388a25c9b1e6ae92b8e35c5c42a"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.15.0/binlogviz_0.15.0_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "e22680be52d3d5adce3f24072bfe1238a29f4566295882298402e17f9ab31996"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.15.0/binlogviz_0.15.0_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "8df7b66c9fc01ee0e144c0e979e8d335b9b6bac37a93af1854ec8e1f97aa897e"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.15.0/binlogviz_0.15.0_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "8749007285bc69b82bb73bce4687a81e048b89936de17076fe2cdc382083458b"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.15.0/binlogviz_0.15.0_linux_arm64.tar.gz",
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
